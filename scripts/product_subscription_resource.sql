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
-- Name: product_subscription_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_subscription_resource (
    product_id character varying(20) NOT NULL,
    subscription_resource_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    purchase_from_date timestamp with time zone,
    purchase_thru_date timestamp with time zone,
    max_life_time numeric(20,0),
    max_life_time_uom_id character varying(20),
    available_time numeric(20,0),
    available_time_uom_id character varying(20),
    use_count_limit numeric(20,0),
    use_time numeric(20,0),
    use_time_uom_id character varying(20),
    use_role_type_id character varying(20),
    automatic_extend character(1),
    cancl_autm_ext_time numeric(20,0),
    cancl_autm_ext_time_uom_id character varying(20),
    grace_period_on_expiry numeric(20,0),
    grace_period_on_expiry_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_subscription_resource OWNER TO ofbiz;

--
-- Name: product_subscription_resource pk_product_subscription_resour; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT pk_product_subscription_resour PRIMARY KEY (product_id, subscription_resource_id, from_date);


--
-- Name: prod_sbrs_atu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_atu ON product_subscription_resource USING btree (available_time_uom_id);


--
-- Name: prod_sbrs_ctu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_ctu ON product_subscription_resource USING btree (cancl_autm_ext_time_uom_id);


--
-- Name: prod_sbrs_gtu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_gtu ON product_subscription_resource USING btree (grace_period_on_expiry_uom_id);


--
-- Name: prod_sbrs_mtu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_mtu ON product_subscription_resource USING btree (max_life_time_uom_id);


--
-- Name: prod_sbrs_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_prod ON product_subscription_resource USING btree (product_id);


--
-- Name: prod_sbrs_sbrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_sbrs ON product_subscription_resource USING btree (subscription_resource_id);


--
-- Name: prod_sbrs_urt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_urt ON product_subscription_resource USING btree (use_role_type_id);


--
-- Name: prod_sbrs_utu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_sbrs_utu ON product_subscription_resource USING btree (use_time_uom_id);


--
-- Name: prt_sbscn_rsc_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_sbscn_rsc_txcs ON product_subscription_resource USING btree (created_tx_stamp);


--
-- Name: prt_sbscn_rsc_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_sbscn_rsc_txsp ON product_subscription_resource USING btree (last_updated_tx_stamp);


--
-- Name: product_subscription_resource prod_sbrs_atu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_atu FOREIGN KEY (available_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_subscription_resource prod_sbrs_ctu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_ctu FOREIGN KEY (cancl_autm_ext_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_subscription_resource prod_sbrs_gtu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_gtu FOREIGN KEY (grace_period_on_expiry_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_subscription_resource prod_sbrs_mtu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_mtu FOREIGN KEY (max_life_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_subscription_resource prod_sbrs_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_subscription_resource prod_sbrs_sbrs; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_sbrs FOREIGN KEY (subscription_resource_id) REFERENCES subscription_resource(subscription_resource_id);


--
-- Name: product_subscription_resource prod_sbrs_urt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_urt FOREIGN KEY (use_role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: product_subscription_resource prod_sbrs_utu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_subscription_resource
    ADD CONSTRAINT prod_sbrs_utu FOREIGN KEY (use_time_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

