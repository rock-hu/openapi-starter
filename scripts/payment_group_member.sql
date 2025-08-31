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
-- Name: payment_group_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_group_member (
    payment_group_id character varying(20) NOT NULL,
    payment_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_group_member OWNER TO ofbiz;

--
-- Name: payment_group_member pk_payment_group_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group_member
    ADD CONSTRAINT pk_payment_group_member PRIMARY KEY (payment_group_id, payment_id, from_date);


--
-- Name: paygrpmmbr_paymnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygrpmmbr_paymnt ON payment_group_member USING btree (payment_id);


--
-- Name: paygrpmmbr_pg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygrpmmbr_pg ON payment_group_member USING btree (payment_group_id);


--
-- Name: pmt_grp_mmr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_grp_mmr_txcrts ON payment_group_member USING btree (created_tx_stamp);


--
-- Name: pmt_grp_mmr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_grp_mmr_txstmp ON payment_group_member USING btree (last_updated_tx_stamp);


--
-- Name: payment_group_member paygrpmmbr_paymnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group_member
    ADD CONSTRAINT paygrpmmbr_paymnt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: payment_group_member paygrpmmbr_pg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_group_member
    ADD CONSTRAINT paygrpmmbr_pg FOREIGN KEY (payment_group_id) REFERENCES payment_group(payment_group_id);


--
-- PostgreSQL database dump complete
--

