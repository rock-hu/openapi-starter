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
-- Name: party_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_status (
    status_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    status_date timestamp with time zone NOT NULL,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_status OWNER TO ofbiz;

--
-- Name: party_status pk_party_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_status
    ADD CONSTRAINT pk_party_status PRIMARY KEY (status_id, party_id, status_date);


--
-- Name: party_sts_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_sts_party ON party_status USING btree (party_id);


--
-- Name: party_sts_stsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_sts_stsitm ON party_status USING btree (status_id);


--
-- Name: party_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_stts_usrlgn ON party_status USING btree (change_by_user_login_id);


--
-- Name: prt_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_stts_txcrts ON party_status USING btree (created_tx_stamp);


--
-- Name: prt_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_stts_txstmp ON party_status USING btree (last_updated_tx_stamp);


--
-- Name: party_status party_sts_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_status
    ADD CONSTRAINT party_sts_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_status party_sts_stsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_status
    ADD CONSTRAINT party_sts_stsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: party_status party_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_status
    ADD CONSTRAINT party_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

