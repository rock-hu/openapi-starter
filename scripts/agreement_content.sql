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
-- Name: agreement_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_content (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    agreement_content_type_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_content OWNER TO ofbiz;

--
-- Name: agreement_content pk_agreement_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_content
    ADD CONSTRAINT pk_agreement_content PRIMARY KEY (content_id, agreement_id, agreement_item_seq_id, agreement_content_type_id, from_date);


--
-- Name: ag_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ag_cnt_cnt ON agreement_content USING btree (content_id);


--
-- Name: ag_cnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ag_cnt_prod ON agreement_content USING btree (agreement_id);


--
-- Name: ag_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ag_cnt_type ON agreement_content USING btree (agreement_content_type_id);


--
-- Name: agrmnt_cntt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_cntt_txcrts ON agreement_content USING btree (created_tx_stamp);


--
-- Name: agrmnt_cntt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_cntt_txstmp ON agreement_content USING btree (last_updated_tx_stamp);


--
-- Name: agreement_content ag_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_content
    ADD CONSTRAINT ag_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: agreement_content ag_cnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_content
    ADD CONSTRAINT ag_cnt_prod FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_content ag_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_content
    ADD CONSTRAINT ag_cnt_type FOREIGN KEY (agreement_content_type_id) REFERENCES agreement_content_type(agreement_content_type_id);


--
-- PostgreSQL database dump complete
--

