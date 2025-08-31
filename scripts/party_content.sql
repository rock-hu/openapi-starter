--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: party_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_content (
    party_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    party_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_content OWNER TO ofbiz;

--
-- Name: party_content pk_party_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content
    ADD CONSTRAINT pk_party_content PRIMARY KEY (party_id, content_id, party_content_type_id, from_date);


--
-- Name: party_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cnt_cnt ON party_content USING btree (content_id);


--
-- Name: party_cnt_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cnt_party ON party_content USING btree (party_id);


--
-- Name: party_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cnt_type ON party_content USING btree (party_content_type_id);


--
-- Name: prt_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntnt_txcrts ON party_content USING btree (created_tx_stamp);


--
-- Name: prt_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntnt_txstmp ON party_content USING btree (last_updated_tx_stamp);


--
-- Name: party_content party_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content
    ADD CONSTRAINT party_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: party_content party_cnt_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content
    ADD CONSTRAINT party_cnt_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_content party_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content
    ADD CONSTRAINT party_cnt_type FOREIGN KEY (party_content_type_id) REFERENCES party_content_type(party_content_type_id);


--
-- PostgreSQL database dump complete
--

